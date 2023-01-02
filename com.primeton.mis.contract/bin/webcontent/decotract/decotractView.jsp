<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- 
  - Author(s): zhx
  - Date: 2015-10-15 10:24:54
  - Description:
-->
	<head>
		<title>审批意见</title>
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
	<body>
		<div class="nui-fit">
			<form id="form1" method="post" >
				<input name="miscontapp.contappid" id="contappId" class="nui-hidden" />
				<input id="miscontapp.misAppyjs" class="nui-hidden" />
			 	<fieldset style="border:solid 1px #aaa;padding:3px;">
	            	<legend>待签署合同基本信息</legend>
	            	<div style="padding:5px;">
		            	<table style="table-layout:fixed;" id="table_file">
			                <tr>
			                    <td style="width:110px;" align="right">合同类型：</td>
			                    <td style="width:150px;">    
			                        <input class="mini-dictcombobox" name="miscontapp.contapptype" id="contapptype" dictTypeId="MIS_DECONTRACTTYPE" readonly="true" onvaluechanged="onNameFilterChanged(this.value)"/>
			                    </td>
			                    <td style="width:110px;" align="right">合同编号：</td>
			                    <td style="width:150px;">    
			                        <input name="miscontapp.contappnum" id="contappnum" class="nui-textbox" readonly="true"/>
			                    </td>
				                <td style="width:110px;" align="right">提交审批日期：</td>
				                <td style="width:150px;">
				                    <input name="miscontapp.tjappdate" id="tjappdate" class="nui-datepicker" readonly="true" allowInput="false"/>
				                </td>
			                </tr>
			                <tr>  
			                    <td style="width:110px;" align="right">签署单位：</td>
			                    <td style="width:150px;">    
			                        <input class="nui-buttonedit" readonly="true" style="width:200px" name="miscontapp.misCustinfo.custid" id="custid" value="" text="" onbuttonclick="onButtonEdit" showClose="true" oncloseclick="onCloseClick"  allowInput="false"/>
			                    </td>
			                     <td style="width:110px;" align="right">销售：</td>
			                    <td style="width:150px;">    
			                        <input class="nui-buttonedit" readonly="true" name="miscontapp.saleid" id="salename" onbuttonclick="showExserver" showClose="true" allowInput="false"/>
			        				
			                    </td>
			                    <td style="width:110px;" align="right">所属事业部：</td>
			                    <td style="width:150px;">
			                    	<input class="mini-dictcombobox" readonly="true" name="miscontapp.syb" id="syb" dictTypeId="CONT_ORG" />
			                    </td> 
				            </tr>
			                <tr style="display:">
			                    <td style="width:110px;" align="right">项目名称：</td>
			                    <td style="width:150px;" >    
			                        <input name="miscontapp.projectname" readonly="true" id="projectname" style="width:200px" class="nui-textbox"/>
			                    </td>
			                    <td style="width:110px;" align="right">经办人：</td>
			                    <td style="width:150px;">    
			                        <input class="nui-buttonedit" readonly="true" name="miscontapp.managerid" id="managername" onbuttonclick="showExserver1" showClose="true" requiredErrorText="不能为空" allowInput="false"/>
			        				
			                    </td>
			                    <td id=temp1 style="width:110px;" align="right">对应合同存档编号：</td>
		                    	<td id=temp2 style="width:150px;">    
		                        <input class="nui-buttonedit" style="width:200px" readonly="true" name="miscontapp.csContract.contractid" id="contractid" onbuttonclick="showContract" showClose="true" oncloseclick="onCloseClick"  allowInput="false"/>
		                    </td>
			                </tr> 
			                <tr>
			                    <td style="width:110px;" align="right">合同金额：</td>
			                    <td style="width:150px;">    
			                        <input name="miscontapp.contmo" id="contmo" readonly="true" class="nui-textbox" allowInput="true"/>
			                    </td>
			                    <td style="width:110px;" align="right">采购1：</td>
			                    <td style="width:150px;">    
			                        <input name="miscontapp.outsofee1" id="outsofee1" readonly="true" class="nui-textbox" allowInput="true"/>
			                    </td>
			                    <td style="width:110px;" align="right">采购2：</td>
			                    <td style="width:150px;">    
			                        <input class="nui-textbox" name="miscontapp.outsofee2" readonly="true" id="outsofee2" allowInput="true"/>
			                    </td>
			                </tr>
			                <tr>
			                    <td style="width:110px;" align="right">审批状态：</td>
			                    <td style="width:150px;">
			                    	<input class="mini-dictcombobox" name="miscontapp.appstatus" id="appstatus" readonly="true" dictTypeId="MIS_CONTAPPSTATUS" />
			                    </td>
			                    <td style="width:110px;" align="right">签订状态：</td>
			                    <td style="width:150px;">
			                    	<input class="mini-dictcombobox" name="miscontapp.signstatus" id="signstatus" readonly="true" dictTypeId="MIS_CONTSIGNSTATUS" />
			                    </td>
			                    <td class="form_label" align="right" >是否保存发送:</td>
					           	<td colspan="1">
					            	<input id="emailstatus" class="nui-dictcombobox" dictTypeId="MIS_MAILSTATUS" readonly="true" name="miscontapp.emailstatus"/>  
					            </td>
			                </tr>
			                <tr>
			                	<td style="width:110px;" align="right">已上传的文件：</td>
			                	<td style="width:670px;" id="uploadedFile" colspan="5"></td>
			                </tr>             
			            </table>
	        		</div>
	        	</fieldset>
			</form>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>最终审批结果</legend>
				<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" dataField="miscontapp.misAppsprs" allowCellEdit="true" editNextOnEnterKey="true">	
		            <div property="columns">
		              <div field="sprname" width="50px">审批人</div>
		              <div field="appsprstatus" width="100px" renderer="getAppsprstatus">最终审批结果</div>
		            </div>
				</div>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>审批意见历史记录</legend>
				<div id="datagrid3" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" dataField="miscontapp.misAppyjs" allowCellEdit="true" editNextOnEnterKey="true">	
		            <div property="columns">
		              <div field="sprid" width="50px" renderer="onGenderRenderer">审批人</div>
		              <div field="appyj" width="50px">审批意见</div>
		              <div field="appjg" renderer="getAppsprstatus" width="50px">审批结果</div>
		              <div field="appyjdate" dateFormat="yyyy-MM-dd H:mm:ss" width="50px">审批时间</div>
		            </div>
				</div>
			</fieldset>
			
		</div> 
		<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
		         
		    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div>
		<script type="text/javascript">
			nui.parse();
			var cid = '<%=request.getParameter("contappid") %>';
			var data = {contappid: cid};
			
			SetData(data);
			
			var form = new nui.Form("form1");
			var grid2 = nui.get("datagrid2");
			var appyjids = "";	
			var Misappsprs = "";
			var clock = "";
		        var now = new Date();  
			    var year = now.getFullYear();       //年  
			    var month = now.getMonth() + 1;     //月  
			    var day = now.getDate();            //日  
			         
			    var hh = now.getHours();            //时  
			    var mm = now.getMinutes();          //分  
			    var ss=now.getSeconds();            //秒  
			    var clock = year + "-";  
			         
			    if(month < 10) clock += "0";         
			    clock += month + "-";  
			         
			    if(day < 10) clock += "0";   
			    clock += day + " ";  
			         
			    if(hh < 10) clock += "0";  
			    clock += hh + ":";  
			  
			    if (mm < 10) clock += '0';   
			    clock += mm+ ":";  
			          
			    if (ss < 10) clock += '0';   
			    clock += ss;
			function gridAddRow(datagrid){		
		        var grid = nui.get(datagrid);
			         
			    
		        grid.addRow({"appyjdate":clock});
		    }
	        function gridRemoveRow(datagrid) {
		        var grid = nui.get(datagrid);
		        var rows = grid.getSelecteds();
		        if (rows.length > 0) {
		        	 grid.removeRows(rows, true);
		        }
	      	}	
			function SetData(data){		  
				
				//跨页面传递的数据对象，克隆后才可以安全使用 
	            data = nui.clone(data);
				var json = nui.encode({miscontapp:data});
				
	            nui.ajax({
	                url: "com.primeton.mis.contract.decontract.getDecontract.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
	                success: function (text) {
	                	o= nui.decode(text)
	                	showEmpAndOrg(o.miscontapp.contapptype);
	                	form.setData(o);
	                    form.setChanged(false);
	                     var tempSrc = "";
			                for(var i=0;i<text.miscontapp.files.length;i++){
			                	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + text.miscontapp.files[i].fileId + "'>" + text.miscontapp.files[i].fileName + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" + text.miscontapp.files[i].fileId + ")'></a>,";
			                }
			               	document.getElementById("uploadedFile").innerHTML = tempSrc;
	                	nui.parse();
	                	nui.get("datagrid1").setData(o.miscontapp.misAppsprs);
	                	
	                	 if(o.miscontapp.misCustinfo){	
	                    	nui.get("custid").setText(o.miscontapp.misCustinfo.custname);                   	                   	
	                    }
	                    if(o.miscontapp.csContract){
	                    	nui.get("contractid").setText(o.miscontapp.csContract.contnum);                   	                   	
	                    }        
	                    nui.get("salename").setText(o.miscontapp.salename);
	                    nui.get("managername").setText(o.miscontapp.managername);
	                    Misappsprs = o.miscontapp.misAppsprs;
	                    if(o.miscontapp.misAppyjs.length == 0){
	                    	for(var i=0;i<o.miscontapp.misAppsprs.length;i++){
	                    		var json = {"sprid": o.miscontapp.misAppsprs[i].sprid,"appjg":"1","appyjdate":clock};
	                    		o.miscontapp.misAppyjs.push(json);
	                    		grid2.setData(o.miscontapp.misAppyjs);
	                    	}
	                    }else{
	                    nui.get("datagrid3").setData(o.miscontapp.misAppyjs);
		                <%--grid2.setData(o.miscontapp.misAppyjs);--%>
		                nui.get("datagrid3").sortBy("appyjdate","desc");
	               		}
	                },
	                error: function () {
	                	alert("Ajax call error");
	               }                
	            });
	            appyjids=data.contappid;
            }
            function showEmployee(e) {
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
			function onOk(){ 
				SaveData();
		    }
		    function onCancel(e) {   	
		    	if(window.CloseOwnerWindow){
		    	 	return window.CloseOwnerWindow(e);
		    	}else{
					window.close();
		    	}  
		    }
		    function SaveData() {		
		    	var data = grid2.getData();	
		        var json = nui.encode({"misappyjs":data,"contappid": appyjids});
		        nui.ajax({
		            url: "com.primeton.mis.contract.decontract.addAppspryj.biz.ext",
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
		    function getAppsprstatus(e) {
		        	return nui.getDictText('MIS_DESPJG',e.value);
		    }
		    function onGenderRenderer(e) {
		    	
		    	for(var i=0;i<Misappsprs.length;i++){
		    		if(Misappsprs[i].sprid == e.value){
		    			return Misappsprs[i].sprname;
		    		}
		    	}
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
		</script>		      
	</body>
</html>