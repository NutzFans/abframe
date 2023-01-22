<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- 
  - Author(s): zhx
  - Date: 2015-10-13 13:52:12
  - Description:
-->
	<head>
		<title>新增/修改待签署合同</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
			<link href="../demo.css" rel="stylesheet" type="text/css" />
			<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
		    <style type="text/css">
			    html, body
			    {
			        font-size:12px;
			        padding:0;
			        margin:0;
			        border:0;
			        height:100%;
			        overflow:hidden;
			    }
		    </style>
	</head>
	<body style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-fit">
		<form id="form1" method="post" >
			<input name="miscontapp.contappid" id="contappId" class="nui-hidden" />
		 	<fieldset style="border:solid 1px #aaa;padding:3px;">
            	<legend>待签署合同基本信息</legend>
	            <div style="padding:5px;">
	            <table style="table-layout:fixed;" id="table_file">
            		<tr>
	                    <td style="width:110px;" align="right">合同类型：</td>
	                    <td style="width:150px;">    
	                        <input class="mini-dictcombobox" name="miscontapp.contapptype" id="contapptype" dictTypeId="MIS_DECONTRACTTYPE" required="true" requiredErrorText="不能为空" onvaluechanged="onNameFilterChanged(this.value)"/>
	                    </td>
	                    <td style="width:110px;" align="right">合同编号：</td>
	                    <td style="width:150px;">    
	                        <input name="miscontapp.contappnum" id="contappnum" class="nui-textbox" />
	                    </td>
		                <td style="width:110px;" align="right">提交审批日期：</td>
		                <td style="width:150px;">
		                    <input name="miscontapp.tjappdate" id="tjappdate" class="nui-datepicker"  allowInput="false"/>
		                </td>
	                </tr>
	                <tr>  
	                    <td style="width:110px;" align="right">签署单位：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-buttonedit" style="width:200px" name="miscontapp.misCustinfo.custid" id="custid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" oncloseclick="onCloseClick"  allowInput="false"/>
	                    </td>
	                     <td style="width:110px;" align="right">销售：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-buttonedit" name="miscontapp.saleid" id="salename" onbuttonclick="showExserver" showClose="true"  requiredErrorText="不能为空" allowInput="false"/>
	        				
	                    </td>
	                    <td style="width:110px;" align="right">所属事业部：</td>
	                    <td style="width:150px;">
	                    	<input class="mini-dictcombobox" name="miscontapp.syb" id="syb" dictTypeId="CONT_ORG" />
	                    </td> 
	                <tr style="display:">
	                    <td style="width:110px;" align="right">项目名称：</td>
	                    <td style="width:150px;" >    
	                        <input name="miscontapp.projectname" id="projectname" style="width:200px" class="nui-textbox"/>
	                    </td>
	                    <td style="width:110px;" align="right">经办人：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-buttonedit" name="miscontapp.managerid" id="managername" onbuttonclick="showExserver1" showClose="true"  requiredErrorText="不能为空" allowInput="false"/>
	        				
	                    </td>
	                     <td id=temp1 style="width:110px;" align="right">对应合同存档编号：</td>
	                    <td id=temp2 style="width:150px;">    
	                        <input class="nui-buttonedit" style="width:200px" name="miscontapp.csContract.contractid" id="contractid" onbuttonclick="showContract" showClose="true" oncloseclick="onCloseClick"  allowInput="false"/>
	                    </td>
	                </tr>
	                <tr>
	 					<td style="width:110px;" align="right">审批人：</td>
		                <td >    
		                    <input class="nui-checkbox" text="刘亚东(0001)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="司建伟(sijw)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="杨玉宝(0039)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                 <td >    
		                    <input class="nui-checkbox" text="聂拥军(0407)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="焦烈焱(0015)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
	                </tr>
	                <tr>
		 				<td ></td>
		                <td >    
		                    <input class="nui-checkbox" text="逯亚娟(0097)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="王克强(0049)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		               <td >    
		                    <input class="nui-checkbox" text="刘伟强(1114)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="甄强(0408)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="帅小艳(0061)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
	                </tr>
	                <tr>
		 				<td ></td>
		                <td >    
		                    <input class="nui-checkbox" text="周立(0621)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="杨卫东(0562)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="李浩洁(0630)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="陈勇强(0640)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="唐军(0300)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
	                </tr>
	                <tr>
		 				<td ></td>
		 				<td >    
		                    <input class="nui-checkbox" text="王葱权(0020)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="钱军(0237)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="贺通(0280)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="施杰(0655)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                <td >    
		                    <input class="nui-checkbox" text="李亮(0634)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
		                
	                </tr>
	                <tr>
		 				<td ></td>
		 				<td >    
		                    <input class="nui-checkbox" text="袁义(0060)" value="false" oncheckedchanged="setSPR(this)"/>
		                </td>
	                </tr>
	                <tr style="display:">
	                    <td style="width:110px;" align="right"></td>
	                    <td style="width:410px;" colspan="3">   
		                    <input id="lookup2" name="miscontapp.sprid" class="nui-lookup" style="width:400px;" textField="empname" valueField="userid" popupWidth="auto" 
			           		popup="#gridPanel" grid="#datagrid3" multiSelect="true" required="true" requiredErrorText="不能为空" />	 	                     
	                    </td>                 
	                </tr>
	                <tr>
	                    <td style="width:110px;" dataType="currency" align="right">合同金额：</td>
	                    <td style="width:150px;">    
	                        <input name="miscontapp.contmo" id="contmo" vtype="float" floatErrorText="请输入数字" class="nui-textbox" allowInput="true" />
	                    </td>
	                    <td style="width:110px;" dataType="currency" align="right">外包1：</td>
	                    <td style="width:150px;">    
	                        <input name="miscontapp.outsofee1" id="outsofee1" class="nui-textbox" vtype="float" floatErrorText="请输入数字" allowInput="true"/>
	                    </td>
	                    <td style="width:110px;" dataType="currency" align="right">外包2：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-textbox" name="miscontapp.outsofee2" vtype="float" floatErrorText="请输入数字" id="outsofee2" allowInput="true"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td style="width:110px;" align="right">审批状态：</td>
	                    <td style="width:150px;">
	                    	<input class="mini-dictcombobox" name="miscontapp.appstatus" id="appstatus" dictTypeId="MIS_CONTAPPSTATUS" />
	                    </td>
	                    <td style="width:110px;" align="right">签订状态：</td>
	                    <td style="width:150px;">
	                    	<input class="mini-dictcombobox" name="miscontapp.signstatus" id="signstatus" dictTypeId="MIS_CONTSIGNSTATUS" />
	                    </td>
	                    <td class="form_label" align="right" >是否保存发送:</td>
			           	<td colspan="1">
			            	<input id="emailstatus" class="nui-dictcombobox" dictTypeId="MIS_MAILSTATUS" name="miscontapp.emailstatus" required="true" requiredErrorText="不能为空"/>  
			            </td>
	                </tr>
	                <tr>
	                	<td style="width:110px;" align="right">已上传的文件：</td>
	                	<td style="width:670px;" id="uploadedFile" colspan="5"></td>
	                </tr>
	                <tr>
	                	<td style="width:110px;" align="right">合同文件上传：</td>
	                	<td style="width:670px;" colspan="5">
	                		<div id="upload_div"></div>
		       	  		</td>
                	</tr>               
	            </table>
	        	</div>                
        	</fieldset>
    	</form>
		</div>      
        <div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
		    <a class="nui-button" id="okbutton" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
		    <a class="nui-button" onclick="onCancel" style="width:60px;">取消</a>
		</div>
		<div id="gridPanel" class="nui-panel" title="header" iconCls="icon-add" style="width:450px;height:250px;" 
				         showToolbar="true" showCloseButton="true" showHeader="false" bodyStyle="padding:0" borderStyle="border:0" >
	        <div property="toolbar" style="padding:5px;padding-left:8px;text-align:center;">   
	            <div style="float:left;padding-bottom:2px;">
	                <span>审批人：</span>                
	                <input id="keyText" class="nui-textbox" style="width:160px;" onenter="onSearchClick"/>
	                <a class="nui-button" onclick="onSearchClick">查询</a>
	                <a class="nui-button" onclick="onClearClick">清除</a>
	            </div>
	            <div style="float:right;padding-bottom:2px;">
	                <a class="nui-button" onclick="onCloseClick">关闭</a>
	            </div>
	            <div style="clear:both;"></div>
	        </div>
	        <div id="datagrid3" class="nui-datagrid" style="width:100%;height:100%;" borderStyle="border:0" showPageSize="false" 
             	showPageIndex="false" url="com.primeton.mis.contract.decontract.querySpr.biz.ext" >
	             <div property="columns">
                 <div type="checkcolumn" ></div>
                 <div field="empname" width="120" headerAlign="center" allowSort="true">审批人姓名</div>    
                 <div field="userid" width="100%" headerAlign="center" allowSort="true">登录名</div>                                            
                 <div field="mobileno" width="100" headerAlign="center" allowSort="true">手机</div>                                           
                 <div field="oemail" width="100" headerAlign="center" allowSort="true">邮箱</div>                                            
                 <div field="orgname" width="100" headerAlign="center" allowSort="true">部门</div>                 
         	 	 </div>
	        </div>  
	    </div>				    
        <script type="text/javascript">
			var updateURL = "com.primeton.mis.contract.decontract.updateDecontract.biz.ext";
	    	var addURL = "com.primeton.mis.contract.decontract.addDecontract.biz.ext";
	    	var saveURL = "";        
	        nui.parse();
	        var sf;
    		sf=new SWFFileUpload(nui.decode({
		    		name:'miscontapp.fileids',
		    		renderTo:'#upload_div',
					value:'',
					cancelBtnText:'取消上传',
					maxFileCount:10,
					minFileCount:0,
					width:'600px',
					title:'上传附件',
					height:'',
					hasCancel:false,
					hiddenType:'nui',
					autoUpload:false,
					uploadUrl:'com.primeton.mis.contract.contractFileUpload.flow'}));
	
			function startUpload(succ){
				sf.startUpload(function(){
					if(succ){
						succ();
					}
				},function(){
					alert('文件上传失败！');
				});
			}
	        var form = new nui.Form("form1");
	        
	        function SetData(data){
		        if(data.action == "new"){
	    			nui.get("signstatus").disable();
	    			nui.get("appstatus").disable();
	    			nui.get("appstatus").setValue(3);
				}else if(data.action == "edit"){
				nui.get("emailstatus").disable();
				nui.get("appstatus").disable();
				data = nui.clone(data);  //跨页面传递的数据对象，克隆后才可以安全使用
				var json = nui.encode({miscontapp:data});
				nui.ajax({
		            url: "com.primeton.mis.contract.decontract.getDecontract.biz.ext",
					type: 'POST',
					data: json,
					cache:false,	
					contentType: 'text/json',
		            success: function (text) {
			            obj = nui.decode(text);
			           	showEmpAndOrg(obj.miscontapp.contapptype);	 
		                form.setData(obj);
		                form.setChanged(false); //设置是否变动
		                var tempSrc = "";
		                for(var i=0;i<text.miscontapp.files.length;i++){
		                	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + text.miscontapp.files[i].fileId + "'>" + text.miscontapp.files[i].fileName + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" + text.miscontapp.files[i].fileId + ")'></a>,";
		                }
		               	document.getElementById("uploadedFile").innerHTML = tempSrc;
		               	nui.parse(); 
		                if(obj.miscontapp.misCustinfo){
                    	nui.get("custid").setText(obj.miscontapp.misCustinfo.custname);                   	                   	
                    }     
                    	if(obj.miscontapp.csContract){
                    	nui.get("contractid").setText(obj.miscontapp.csContract.contnum);                   	                   	
                    }     
                    nui.get("salename").setText(obj.miscontapp.salename);
                    nui.get("managername").setText(obj.miscontapp.managername);
                    var sprname = "";
                    var sprid = "";
                    for(var i=0;i<obj.miscontapp.misAppsprs.length;i++){
                    	sprname += obj.miscontapp.misAppsprs[i].sprname+",";
                    	sprid += obj.miscontapp.misAppsprs[i].sprid+",";
                    }
                    sprname = sprname.substring(0,sprname.length-1);
                    sprid = sprid.substring(0,sprid.length-1);
                    nui.get("lookup2").setText(sprname);
                    nui.get("lookup2").setValue(sprid);
		               }
		              
		        });
		        }
			}
			function saveData(){
		        form.validate();    //验证表单
		        if(form.isValid()==false) return;   //如果表单验证不通过
		        var data = form.getData(false,true);		       
		        var contappId = nui.get("contappId").getValue();
				if(contappId){
					saveURL = updateURL;
				} else{
					saveURL = addURL;
				}				
		        var json = nui.encode(data);//把JS对象序列化为字符串		        
		        nui.ajax({
		          url:saveURL,
		          type:'POST',
		          data:json,
		          cache:false,
		          contentType:'text/json',
		          success:function(text){
		            var returnJson = nui.decode(text);		            
		            if(returnJson.exception == null){
		              CloseWindow("save");		              
		              var contappid=returnJson.contappid;
		              var send=nui.get("emailstatus").value;
					  if(send==1)
					       {	
					       var url="com.primeton.mis.decontract.decontractappload.flow?contappid="+contappid;
					       window.open(url);
					       }
					  var sign=nui.get("signstatus").value;
					  if(sign==2){			      
						  var url = "<%=request.getContextPath() %>/contract/contract/contractModify.jsp?contappid="+contappid;
						     window.open(url);						    
					       }
		            }else{
		              nui.alert("保存失败", "系统提示", 
		              function(action){
		                if(action == "ok" || action == "close"){
		                  CloseWindow("saveFailed");
		                }
		                });
		              }
		            }
	            });
          	}
			 //“签署单位”点击选择时的方法
    		function onButtonEdit(e) {
		        var btnEdit = this;	
		        nui.open({
					url:"<%=contextPath%>/contract/contract/MisCustinfo_lookup.jsp",
					title: "选择列表",
					width: 600,
					height: 400,
					ondestroy: function (action) {
						if (action == "ok") {
							var iframe = this.getIFrameEl();
							var data = iframe.contentWindow.GetData();
							data = nui.clone(data);    //必须
							if (data) {
				                btnEdit.setValue(data.id);
				                btnEdit.setText(data.text);
							}
						}
					}
				});
			}
			//“合同存档编号”点击选择时的方法
			function showContract(e) {
		        var btnEdit = this;	
		        nui.open({
					url:"<%=contextPath%>/contract/decotract/SelectContract.jsp",
					title: "选择列表",
					width: 600,
					height: 400,
					ondestroy: function (action) {
						if (action == "ok") {
							var iframe = this.getIFrameEl();
							var data = iframe.contentWindow.GetData();
							data = nui.clone(data);    //必须
							if (data) {
				                btnEdit.setValue(data.contractid);
				                btnEdit.setText(data.contnum);
							}
						}
					}
				});
			}
			//选择销售时的方法
			function showExserver(e) {
        		var btnEdit = this;
				nui.open({
	            url:"<%=contextPath%>/contract/contract/SelectSale.jsp",
				title: "选择列表",
				width: 650,
				height: 380,
				ondestroy: function (action) {
	                //if (action == "close") return false;
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
			//选择经办人时的方法
			function showExserver1(e) {
        		var btnEdit = this;
				nui.open({
	            url:"<%=contextPath%>/contract/contract/SelectSale.jsp",
				title: "选择列表",
				width: 650,
				height: 380,
				ondestroy: function (action) {
	                //if (action == "close") return false;
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
			function doDelete(fileID){
				nui.confirm("确定删除该附件？", "确定？",
		            function (action) {
		                if (action == "ok") {
							var json = nui.encode({fileid: fileID});
		                    nui.ajax({
				                url: "com.primeton.mis.contract.contract.deleteFile.biz.ext",
								type: 'POST',
								data: json,	
								contentType: 'text/json',
				                success: function (o) {
				                    var tempSrc = "";
				                    for(var i=0;i<o.files.length;i++){
				                    	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.files[i].fileId + "'>" + o.files[i].fileName + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" + o.files[i].fileId + ")'></a>,";
				                    }
				                   	document.getElementById("uploadedFile").innerHTML = tempSrc;
				                   	nui.parse(); 				
				                }
				            });
		                }
		            }
		        );
			}
			function onOk(e){
				if(!form.validate()){
			    	return;
			    } else{
			    	startUpload(saveData);
			    }   
		  	} 
			function onCancel(){
       			CloseWindow("cancel");
     		 }
      
      		function CloseWindow(action){
	      		if(action=="close"){
	      		}else if(window.CloseOwnerWindow)
	      		return window.CloseOwnerWindow(action);
	      		else
	      		return window.close();
      		}
      		function onNameFilterChanged(e){
		    	var tempType=e;
		    	showEmpAndOrg(tempType);
		    }
     		function showEmpAndOrg(tempType){
	    		if(tempType == 06){   		
					document.getElementById("temp1").style.display = "";
					document.getElementById("temp2").style.display = "";		
					nui.get("contractid").setValue("");
		    	} else {
		    		document.getElementById("temp1").style.display = "none";
					document.getElementById("temp2").style.display = "none";			
		    	} 
		    }     		
	        var grid = nui.get("datagrid3");
	        var keyText = nui.get("keyText");	
	        grid.load();
	        function onSearchClick(e) {
	            grid.load({
	                empname: keyText.value
	            });
	        }
	        function onCloseClick(e) {
	            var lookup2 = nui.get("lookup2");
	            lookup2.hidePopup();
	        }
	        function onClearClick(e) {
	            var lookup2 = nui.get("lookup2");
	            lookup2.deselectAll();
	        }
	        function setSPR(e){
	        	var empnamecode = e.text;
	        	var empname = empnamecode.substring(0,empnamecode.indexOf("("));
	        	var empcode = empnamecode.substring(empnamecode.indexOf("(")+1,empnamecode.indexOf(")"));
	        	var oldValue = nui.get("lookup2").getValue();
	        	var oldText = nui.get("lookup2").getText();
	        	if(e.value == "true"){//我被选中了，那么我去判断审批人中是否有我，如果没有我，我就加进去
	        		if(oldValue == null || oldValue == ""){
		        		nui.get("lookup2").setText(empname);
	                    nui.get("lookup2").setValue(empcode);
	                }else{
	             		var isHaveMe = false;
	             		var oldValues = oldValue.split(",");
	             		for(var i=0;i<oldValues.length;i++){
	             			if(empcode == oldValues[i]){
	             				isHaveMe = true;
	             			}
	             		}
	             		if(isHaveMe == false){
	             			nui.get("lookup2").setText(oldText+","+empname);
	             			nui.get("lookup2").setValue(oldValue+","+empcode);
	             		}
	                }
	        	}else{//我被取消了，那么我去判断审批人中是否有我，如果有我，我就删掉
	        		var isHaveMe = false;
             		var oldValues = oldValue.split(",");
             		for(var i=0;i<oldValues.length;i++){
             			if(empcode == oldValues[i]){
             				isHaveMe = true;
             			}
             		}
             		if(isHaveMe == true){
            			var sprname = oldText.replace(eval("/,?"+empname+",?/"),' ').trim(' ').replace(' ',',');
             			var sprid = oldValue.replace(eval("/,?"+empcode+",?/"),' ').trim(' ').replace(' ',',');	
             			nui.get("lookup2").setText(sprname);
             			nui.get("lookup2").setValue(sprid);        			
             		}
        		}
	        }
      </script>
	</body>
</html>