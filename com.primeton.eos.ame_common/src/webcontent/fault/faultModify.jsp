<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>

<head>
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
	<title>增加/修改故障信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<!--<link href="../demo.css" rel="stylesheet" type="text/css" />	-->
</head>

<body>
<div class="nui-fit">
	<form id="form1" method="post" >
		<input name="probinfo.probid" id="probid" class="nui-hidden" />
        <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
            <legend>故障基本信息</legend>                       
            <div style="padding:5px;">
            <table id="table_file">
                <tr>
                    <td style="width:120px;" align="right">故障类型：</td>
                    <td style="width:150px;">    
	                    <input class="nui-dictcombobox" name="probinfo.probtype" id="probtype" dictTypeId="MIS_FA_TYPE" required="true" onvaluechanged="onProbTypeChanged(this.value)"/>
	                </td>
                	<td id="temp1" width="120px" align="right">对应服务器：</td>
                    <td id="temp2" width="150px">    
						<input property="editor" name="probinfo.servid" id="servid" class="nui-buttonedit" showClose="false" required="true" allowInput="false" onbuttonclick="showServer"/>
                    </td>                    
                	<td id="temp3" width="120px" align="right">对应应用：</td>
                    <td id="temp4" width="150px">    
						<input property="editor" name="probinfo.appid" id="appid" class="nui-buttonedit" showClose="false" required="true" allowInput="false" onbuttonclick="showApp"/>
                    </td>
                	<td id="temp5" width="120px" align="right">对应数据库：</td>
                    <td id="temp6" width="150px">    
						<input property="editor" name="probinfo.dbid" id="dbid" class="nui-buttonedit" showClose="false" required="true" allowInput="false" onbuttonclick="showDb"/>
                    </td>
	            </tr>
	            <tr>
	                <td style="width:120px;" align="right">故障发现人：</td>
                    <td style="width:150px;">    
						<input property="editor" name="probinfo.probfinder" id="probfinder" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/>
                    </td>
                    <td style="width:120px;" align="right">故障发现日期：</td>
					<td style="width:150px;">
                        <input name="probinfo.probfinddate" id="probfinddate" class="nui-datepicker" required="true"/>
                    </td>
                    <td style="width:120px;" align="right">故障简述：</td>
                    <td style="width:150px;">
                        <input class="nui-textbox" name="probinfo.probdesc" id="probdesc" required="true"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">故障详述：</td>
                    <td style="width:690px;" colspan="5">    
                        <input class="nui-textarea" name="probinfo.probdescdetail" id="probdescdetail" style="width:400px;" required="false"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">故障处理结果：</td>
                    <td sytle="width:690px;" align="left" colspan="5">
                    	<input class="nui-textbox" name="probinfo.probdealresult" id="probdealresult" class="nui-textbox" required="false" style="width:400px;">
                    </td>   
                </tr>
                <tr>
                	<td style="width:120px;" align="right">备注：</td>
                    <td style="width:690px;" colspan="5">    
                        <input name="probinfo.remark" id="remark" class="nui-textarea" style="width:400px;" required="false"/>
                    </td>
				</tr>
	            <tr>
	            	<td style="width:120px;" align="right">附件列表：</td>
	            	<td style="width:690px;" id="uploadedFile" colspan="5"></td>
	            </tr>	
	            <tr>
	            	<td style="width:120px;" align="right">附件上传：</td>
	            	<td style="width:690px;" colspan="5">
	            		<div id="upload_div"></div>
	       	  		</td>
	            </tr>
            </table>
        	</div>
        </fieldset>
     	<fieldset style="border:solid 1px #aaa;padding:3px;">
	         <legend>故障处理历史记录</legend>
	           <div id="datagrid1" class="nui-datagrid" style="width:100%;height:150px;" showPager="false" 
	           sortMode="client" dataField="probinfo.misProbinfoDeals">
	            <div property="columns">
	              <div field="probdealdate" width="40px">故障处理日期</div>
	              <div field="probdealername" width="50px">故障处理人</div>
	              <div field="probdealinfo" width="50px">故障处理描述</div>
	              <div field="remark" width="100px">备注</div>
	            </div>
	          </div>
	    </fieldset>       
    </form>        
</div>

<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
    <a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">取消</a>
</div>


<script type="text/javascript">
	var form = new nui.Form("form1");
	var updateURL = "com.primeton.eos.ame_common.fault.updateFault.biz.ext";
	var addURL = "com.primeton.eos.ame_common.fault.addFault.biz.ext";
	var saveURL = "";
	var empname = "<b:write property='userObject/userName' scope='session'/>";
	var userid = "<b:write property='userObject/userId' scope='session'/>";
	var setData;
	var sf;
	
	nui.parse();
	
    sf=new SWFFileUpload(nui.decode({
    		name:'probinfo.fileids',
    		renderTo:'#upload_div',
			value:'',
			cancelBtnText:'取消上传',
			maxFileCount:3,
			minFileCount:0,
			width:'',
			height:'',
			hasCancel:false,
			hiddenType:'nui',
			autoUpload:false,
			uploadUrl:'com.primeton.eos.machine.fileUpload.flow'}));
			
	function startUpload(succ){
	
		sf.startUpload(function(){
			if(succ){
				succ();
			}
		},function(){
			alert('附件文件上传失败！');
		});
	}
	
	function SetData(data){	
		setData = data.action;
		var isAdmin = false;

		<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
			var roleid = "<b:write iterateId='roles' property='roleid'/>";
			if(roleid == "admin"){
				isAdmin = true;
			}
		</l:iterate>
		
		nui.get("probtype").disable();
		nui.get("probfinder").disable();
		nui.get("probfinddate").disable();
		nui.get("probdesc").disable();
		nui.get("probdescdetail").disable();
		nui.get("remark").disable();				
		
			//跨页面传递的数据对象，克隆后才可以安全使用 
            data = nui.clone(data);
			var json = nui.encode({probinfo:data});
            nui.ajax({
                url: "com.primeton.eos.ame_common.fault.getFault.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                   	var tempSrc = "";
                    for(var i=0;i<o.probinfo.files.length;i++){
                        tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" 
                        + o.probinfo.files[i].fileId+ "'>" + o.probinfo.files[i].fileName 
                        + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" 
                        + o.probinfo.files[i].fileId + ")'></a>,";
                   }
                    document.getElementById("uploadedFile").innerHTML = tempSrc;
                   	nui.parse();
                   	
                   	nui.get("probfinder").setValue(o.probinfo.probfinder);
                   	nui.get("probfinder").setText(o.probinfo.probfindername);
                   	
					var probtype=o.probinfo.probtype;
					if (probtype == 1) {
						document.getElementById("temp1").style.display = "";
						document.getElementById("temp2").style.display = "";
						document.getElementById("temp3").style.display = "none";
						document.getElementById("temp4").style.display = "none";
						document.getElementById("temp5").style.display = "none";
						document.getElementById("temp6").style.display = "none";
						nui.get("servid").disable();
						nui.get("servid").setValue(o.probinfo.servid);
						nui.get("servid").setText(o.probinfo.servname);
					}
					else if (probtype ==2) {
						document.getElementById("temp1").style.display = "none";
						document.getElementById("temp2").style.display = "none";
						document.getElementById("temp3").style.display = "";
						document.getElementById("temp4").style.display = "";
						document.getElementById("temp5").style.display = "none";
						document.getElementById("temp6").style.display = "none";
						nui.get("appid").disable();
						nui.get("appid").setValue(o.probinfo.appid);
						nui.get("appid").setText(o.probinfo.appchname);
					} else if (probtype == 3) {
						document.getElementById("temp1").style.display = "none";
						document.getElementById("temp2").style.display = "none";
						document.getElementById("temp3").style.display = "none";
						document.getElementById("temp4").style.display = "none";
						document.getElementById("temp5").style.display = "";
						document.getElementById("temp6").style.display = "";
						nui.get("dbid").disable();
						nui.get("dbid").setValue(o.probinfo.dbid);
						nui.get("dbid").setText(o.probinfo.dbname);										
					}

                	form.setData(o);
                    form.setChanged(false);
                    
	                nui.get("datagrid1").setData(o.probinfo.misProbinfoDeals);
	                nui.get("datagrid1").sortBy("probdealdate","desc");
                                        
                }
            });
	}
	
    function onCancel(e) {   	
    	if(window.CloseOwnerWindow){
    	 	return window.CloseOwnerWindow(e);
    	}else{
			window.close();
    	}  
    }
    
	function SaveData() {		
    	var probid = nui.get("probid").getValue();    	
		var saveURL = "";
    	if(probid){
    		saveURL = updateURL;
    	}else{
    		saveURL = addURL;
    	}
		var data = form.getData();

        var json = nui.encode(data);
        nui.ajax({
            url: saveURL,
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	onCancel("save");               
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow("error");
            }
        });
    }
    
    function onOk(){
    	if(!form.validate()){
            return;
    	}
    	
		startUpload(SaveData);

    }
      
    function doDelete(fileID){
        nui.confirm("确定删除该附件？", "确定？",
            function (action) {
                if (action == "ok") {
                    var json = nui.encode({fileid: fileID});
                    nui.ajax({
                        url: "com.primeton.eos.ame_common.fault.deleteFile.biz.ext",
                        type: 'POST',
                        data: json, 
                        contentType: 'text/json',
                        success: function (o) {
                            var tempSrc = "";
                            for(var i=0;i<o.files.length;i++){
                                tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" 
                                + o.fault.files[i].fileId+ "'>" + o.fault.files[i].fileName 
                                + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" 
                                + o.fault.files[i].fileId + ")'></a>,";
                   			}
                            document.getElementById("uploadedFile").innerHTML = tempSrc;
                            nui.parse();                
                        }
                    });
                }
            }
        );
    }       
    
    function onProbTypeChanged(e) {
    	if(e == 1){
    		document.getElementById("temp1").style.display = "";
    		document.getElementById("temp2").style.display = "";
    		document.getElementById("temp3").style.display = "none";
    		document.getElementById("temp4").style.display = "none";
    		document.getElementById("temp5").style.display = "none";
    		document.getElementById("temp6").style.display = "none";
    	} else if(e == 2){
    		document.getElementById("temp1").style.display = "none";
    		document.getElementById("temp2").style.display = "none";
    		document.getElementById("temp3").style.display = "";
    		document.getElementById("temp4").style.display = "";
    		document.getElementById("temp5").style.display = "none";
    		document.getElementById("temp6").style.display = "none";
    	} else if(e == 3){
    		document.getElementById("temp1").style.display = "none";
    		document.getElementById("temp2").style.display = "none";
    		document.getElementById("temp3").style.display = "none";
    		document.getElementById("temp4").style.display = "none";
    		document.getElementById("temp5").style.display = "";
    		document.getElementById("temp6").style.display = "";
    	}    	
    }

    function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/ame_common/fault/SelectEmployee.jsp",
			title: "选择列表",
			width: 800,
			height: 450,
			onload: function () {
				var iframe = this.getIFrameEl();
				var data = {multiSelect:false,isPage:true};
				iframe.contentWindow.SetData(data);
			},
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
				nui.get("probfinder").validate();
			}
		});
	}

    function showServer(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/ame_common/fault/SelectServer.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.servid);
		                btnEdit.setText(data.servname);
					}
				}
				nui.get("servid").validate();
			}
		});
	}

    function showApp(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/ame_common/fault/SelectApp.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.appid);
		                btnEdit.setText(data.appchname);
					}
				}
				nui.get("appid").validate();
			}
		});
	}

    function showDb(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/ame_common/fault/SelectDb.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.dbid);
		                btnEdit.setText(data.dbname);
					}
				}
				nui.get("dbid").validate();
			}
		});
	}
        
</script>
</body>
</html>