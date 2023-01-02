<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<!-- 
  - Author(s): wwx
  - Date: 2014-08-20 10:31:31
  - Description:
-->
<head>
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
	<title>增加/修改资产信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<!--<link href="../demo.css" rel="stylesheet" type="text/css" />	-->
</head>

<body>
<div class="nui-fit">
	<form id="form1" method="post" >
		<input name="machine.id" id="machineId" class="nui-hidden" />
        <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
            <legend>资产基本信息</legend>                       
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td style="width:120px;" align="right">资产类型：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="machine.type" id="type" dictTypeId="MIS_MA_TYPE" required="true" emptyText="请选择" onvaluechanged="onTypeFilterChanged"/>
                    </td>
                    <td style="width:120px;" align="right">子类型：</td>
                    <td style="width:150px;">    
                        <input class="nui-combobox" name="machine.secType" id="sectype" required="true" emptyText="请选择" valueField="dictID" textField="dictName" parentField="parentId" onvaluechanged="getAssetnum"/>
                    </td>
                    <td style="width:120px;" align="right">区域：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="machine.area" id="area" dictTypeId="EXP_REGION" required="true" emptyText="请选择" onvaluechanged="getAssetnum"/>
                    </td>
                </tr>
                <tr>
               	 	<td style="width:120px;" align="right">购买金额：</td>
	                 <td style="width:150px;"> 
	                 	<input name="machine.price" id="price" class="nui-textbox" required="true" vtype="float" emptyText="请输入" onvaluechanged="getAssetAmount"/>	                   
	                </td>
                    <td style="width:120px;" align="right">购买日期：</td>
                    <td style="width:150px;">    
	                    <input name="machine.buytime" id="buytime" class="nui-datepicker" required="true"/>
	                </td>   
                    <td style="width:120px;" align="right">资产编号：</td>
                    <td style="width:150px;">    
                        <input name="machine.assetnum" id="assetnum" class="nui-textbox" required="true"/>
                    </td>
                </tr>
                <tr>
                	<td width="120px" align="right">发票类型：</td>
                	<td width="150px">    
                        <input property="editor" name="machine.invoiceType" id="invoiceType" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" required="true" allowInput="false" emptyText="请选择" onvaluechanged="getAssetAmount"/> 
                    </td>	
                    <td width="120px" align="right">资产领取日期：</td>
                    <td sytle="width:150px;" align="left">
                    	<input property="editor" name="machine.startusedate" id="startusedate" required="true" class="nui-datepicker">
                    </td>  
                    <td style="width:120px;" id="third11" align="right">状态：</td>
                    <td style="width:150px;">    
                        <input class="mini-dictcombobox" name="machine.status" id="status" dictTypeId="MIS_MA_STATUS" required="true" onvaluechanged="onStatusFilterChanged" emptyText="请选择"/>
                    </td>   
                </tr>
                <tr>
                	<td style="width:120px;" align="right">管理方式：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="machine.storageType" id="storageType" dictTypeId="MIS_MA_STORAGE" required="true" onvaluechanged="onNameFilterChanged(this.value)" emptyText="请选择"/>
                    </td>
                	<td id="temp1" width="120px" align="right">负责人：</td>
                    <td id="temp2" width="150px">    
						<input property="editor" name="machine.usingemp" id="usingemp" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" />
                    </td>
                    <td id="temp3" width="120px" align="right">所属部门：</td>
                    <td id="temp4" width="150px">    
                        <input property="editor" name="machine.dept" id="deptname" class="nui-buttonedit" value="" text="" onbuttonclick="showDept" showClose="false" required="true" allowInput="false"   />
                    </td>
                </tr>              
                <tr>
                	<td width="120px" align="right">资产分类：</td>
                    <td width="150px">
                    	<input property="editor"  name="machine.isguoteng" id="guoteng" class="nui-dictcombobox"  dictTypeId="MIS_MA_GUOTENG" required="true" allowInput="false"  onvaluechanged="getGuoTeng"/>
                    </td>
                    <td id="temp5" width="120px" align="right">所属项目：</td>
                    <td id="temp6" width="150px">    
                        <input property="editor" name="machine.projectno" id="projectno" class="nui-buttonedit" value="" text="" onbuttonclick="selectProject" showClose="false"  />
                    </td>
                    <td style="width:120px;" align="right">操作系统：</td>
                    <td style="width:150px;">    
                        <input name="machine.operatingSystem" id="operatingSystem" class="nui-textbox" required="false"/>
                    </td>                                     
                </tr>
                <tr>
	                <td style="width:120px;" align="right">品牌：</td>
                    <td style="width:150px;">    
                        <input name="machine.brand" id="brand" class="nui-textbox" required="false"/>
                    </td>   
                    <td style="width:120px;" align="right">用途：</td>
                    <td style="width:150px;">    
                        <input name="machine.using" id="using" class="nui-textbox" required="false"/>
                    </td>
                    <td style="width:120px;" align="right" id="operator1">增加人：</td>
                    <td style="width:150px;">    
                        <input name="machine.operator" id="operator" class="nui-buttonedit" required="false"/>
                    </td> 
                </tr>
                <tr>
                    <td style="width:120px;" align="right">型号：</td>
                    <td style="width:150px;">    
                        <input name="machine.model" id="model" class="nui-textbox" required="false" maxLength="25"/>
                    </td>
                    <td style="width:120px;" id="third21" align="right">保修时间(月)：</td>
                    <td style="width:150px;"> 
	                 	<input name="machine.warrantyTime" id="warrantyTime" class="mini-dictcombobox" dictTypeId="MIS_MA_DTIME" vtype="int"/>	                   
	                </td> 
                    <td style="width:120px;" align="right" id="operatingTime1">增加时间：</td>
                    <td sytle="width:150px;" align="left">
                    	<input name="machine.operatingTime" id="operatingTime" class="nui-datepicker">
                    </td>  
                </tr>
                <tr>
                    <td style="width:120px;" align="right">配置：</td>
                    <td style="width:150px;" colspan="5">    
                        <input name="machine.configuration" id="configuration" class="nui-textbox" style="width:700px;" required="false"/>
                    </td>
                </tr>
                <tr>
	                <td style="width:120px;" align="right">存放物理地址：</td>
                    <td style="width:500px;" colspan="5">    
                        <input name="machine.address" id="address" class="nui-textbox" style="width:700px;" required="false"/>
                    </td>
	            </tr>
                <tr>
                	<td style="width:120px;" id="third31" align="right">备注：</td>
                    <td style="width:150px;" colspan="5">    
                        <input name="machine.remarks" id="remarks" class="nui-textarea" style="width:700px;" required="false"/>
                    </td>
				</tr>
	            <tr>
	            	<td style="width:120px;" align="right">发票照片：</td>
	            	<td style="width:400px;" id="uploadedFile" colspan="5"></td>
	            </tr>
	            <tr>
	            	<td style="width:120px;" align="right">发票上传：</td>
	            	<td style="width:670px;" colspan="5">
	            		<div id="upload_div"></div>
	       	  		</td>
	            </tr>
            </table>
        	</div>
        </fieldset>
        
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>资产折旧信息</legend>           
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td style="width:120px;" align="right">资产原值：</td>
                    <td style="width:150px;">    
                        <input name="machine.assetAmount" id="assetAmount" class="nui-textbox" required="true" onvaluechanged="depreciableAmountComp"/>
                    </td>
                    <td style="width:120px;" align="right">税率(例：0.16)：</td>
                    <td style="width:150px;">    
                        <input name="machine.productrate" id="productrate" class="nui-textbox"  onvaluechanged="getAssetAmount"/>
                    </td>
	            </tr>
	            <tr>
	                <td style="width:120px;" align="right">月折旧额：</td>
	                <td style="width:150px;"> 
	                 	<input name="machine.depreciableAmount" id="depreciableAmount" class="nui-textbox" emptyText="自动计算" required="true" vtype="int" allowInput="false" value="" enabled="false"/>	                   
	                </td>
	                <td style="width:120px;" align="right">折旧期限 (月)：</td>
                    <td style="width:150px;"> 
	                 	<input name="machine.depreciableTime" id="depreciableTime" class="mini-dictcombobox" required="true" dictTypeId="MIS_MA_DTIME" vtype="int" onvaluechanged="depreciableAmountComp" emptyText="请选择"/>	                   
	                </td>	               	                
                </tr>
            </table>
        	</div>
        </fieldset>
        
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>资产使用信息</legend>           
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td style="width:120px;" align="right">IP地址：</td>
                    <td style="width:150px;">    
                        <input name="machine.ip" id="ip" class="nui-textbox" required="false"/>
                    </td>
                    <td style="width:120px;" align="right">用户名：</td>
                    <td style="width:150px;">    
                        <input name="machine.username" id="username" class="nui-textbox" required="false"/>
                    </td>
					<td style="width:120px;" align="right">密码：</td>
	                <td style="width:150px;">    
                        <input name="machine.password" id="password" class="nui-textbox" required="false"/>
                    </td>
                </tr>
				<tr>
                	<td style="width:120px;" align="right">安装应用软件：</td>
                	<td style="width:400px;" colspan="5">    
                        <input name="machine.application" id="application" class="nui-textarea" required="false" style="width:403px;"/>
                    </td>
                </tr>
            </table>
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
	var updateURL = "com.primeton.eos.machine.machine.updateMachine.biz.ext";
	var addURL = "com.primeton.eos.machine.machine.addMachine.biz.ext";
	var saveURL = "";
	var empname = "<b:write property='userObject/userName' scope='session'/>";
	var userid = "<b:write property='userObject/userId' scope='session'/>";
	//产品税率
	var  productrate  = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'));
	nui.parse();
	var setData;
	var sf;

    sf=new SWFFileUpload(nui.decode({
    		name:'machine.fileids',
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
			nui.alert('资产文件上传失败！');
		});
	}
	

	function init(){
		
	}
	
	function SetData(data){	
		setData = data.action;
		var isAdmin = false;
		var isFinance = false;
		<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
			var roleid = "<b:write iterateId='roles' property='roleid'/>";
			if(roleid == "admin"){
				isAdmin = true;
			} else if(roleid == "finance"){
				isFinance = true;
			}
		</l:iterate>
		nui.get("operator").disable();
		nui.get("operatingTime").disable();
		nui.get("depreciableTime").disable();
		nui.get("assetAmount").disable();
		var status = nui.get("status");
		status.load([{"dictID":"0","dictName":"使用"},{"dictID":"1","dictName":"入库闲置"},{"dictID":"2","dictName":"入库待修"},{"dictID":"3","dictName":"入库待报废"}]);
		if(data.action == "new"){
    		nui.get("operatingTime").setValue(new Date());
    		nui.get("operator").setValue(userid);
    		nui.get("operator").setText(empname);
    		nui.get("ip").disable();
    		nui.get("username").disable();
    		nui.get("password").disable();
    		nui.get("application").disable();
    		nui.get("depreciableTime").disable();
    		nui.get("productrate").setValue(productrate);
    		$("#operator").hide();
    		$("#operator1").hide();
    		$("#operatingTime").hide();
    		$("#operatingTime1").hide();
    	}else if (data.action == "edit") {
    		$("#operator").show();
    		$("#operator1").show();
    		$("#operatingTime").show();
    		$("#operatingTime1").show();
    		productrate1 = nui.get("productrate").getValue();
    		if(!productrate1){
    			nui.get("productrate").setValue(productrate);
    		}
    		if(isAdmin != true && isFinance == true){
				nui.get("usingemp").disable();
				nui.get("deptname").disable();
				nui.get("area").disable();
				nui.get("status").disable();
				nui.get("storageType").disable();
			}
            if(isAdmin == true && isFinance != true){
				nui.get("buytime").disable();
				nui.get("price").disable();
				nui.get("type").disable();
				nui.get("sectype").disable();
				nui.get("assetnum").disable();		
				nui.get("invoiceType").disable();
			}
			if(isAdmin != true && isFinance != true){
				nui.get("buytime").disable();
				nui.get("price").disable();
				nui.get("type").disable();
				nui.get("sectype").disable();
				nui.get("brand").disable();
				nui.get("model").disable();
				nui.get("configuration").disable();
				nui.get("operatingSystem").disable();
				nui.get("address").disable();
				nui.get("storageType").disable();
				nui.get("usingemp").disable();
				nui.get("deptname").disable();
				nui.get("area").disable();
				nui.get("status").disable();
				nui.get("warrantyTime").disable();
				nui.get("using").disable();
				nui.get("remarks").disable();
				nui.get("operator").disable();
				nui.get("operatingTime").disable();
				nui.get("assetnum").disable();
				nui.get("invoiceType").disable();
				nui.get("guoteng").disable();
				nui.get("projectno").disable();
			}
			//跨页面传递的数据对象，克隆后才可以安全使用 
            data = nui.clone(data);
			var json = nui.encode({machine:data});
            nui.ajax({
                url: "com.primeton.eos.machine.machine.getMachine.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                   	var tempSrc = "";
                    for(var i=0;i<o.machine.files.length;i++){
                        tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.machine.files[i].fileId+ "'>" + o.machine.files[i].fileName + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" + o.machine.files[i].fileId + ")'></a>,";
                   }
                    document.getElementById("uploadedFile").innerHTML = tempSrc;
                   	nui.parse();
                	var temp1=nui.get("usingemp");
                	var temp2=nui.get("deptname");
		            temp1.setValue(o.machine.usingemp);
		            temp1.setText(o.machine.emp);
		            temp2.setValue(o.machine.dept);
		            temp2.setText(o.machine.org);
		            nui.get("operator").setValue(o.machine.operator);
    				nui.get("operator").setText(o.machine.operatorname);
					nui.get("projectno").setValue(o.machine.projectno);
					nui.get("projectno").setText(o.machine.projectno);
                	showEmpAndOrg(o.machine.storageType);
                	form.setData(o);
                    form.setChanged(false);
					nui.get("sectype").load(o.machine.childType);
                }
            });
        }
	}
	
    function onCancel(e) {   	
    	if(window.CloseOwnerWindow){
    	 	return window.CloseOwnerWindow(e);
    	}else{
			window.close();
    	}  
    }
    
	function SaveData() {		
    	var machineId = nui.get("machineId").getValue();    	
		var saveURL = "";
    	if(machineId){
    		saveURL = updateURL;
    	}else{
    		saveURL = addURL;
    	}
		var o = form.getData();
        var json = nui.encode(o);
        nui.ajax({
            url: saveURL,
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	if(text.exception){
            		nui.alert("保存失败！");
            		return;
            	}else{
	            	onCancel("save");               
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow("error");
            }
        });
    }
    
    function onOk(){
    	if(!form.validate()){
            return;
    	}
    	var machineId = nui.get("machineId").getValue();
    	var guoteng = nui.get("guoteng").getValue();
    	var projectno = nui.get("projectno").getValue();
    	if(guoteng == "1"){
    		if(projectno == null || projectno ==""){
    			nui.alert("资产分类为项目资产，必须对于所属项目！");
    			return;
    		}
    	}
    	if(machineId){
			startUpload(SaveData);
		} else {
	    	var assetnum = nui.get("assetnum");
	    	var num=assetnum.getValue();
	    	var data={assetnum:num};
	    	var json=nui.encode(data);
	    	nui.ajax({
	    		url: "com.primeton.eos.machine.machine.validateAssetnum.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function(o){
					if(o.test == false){
						nui.alert("资产编号已经存在,请输入一个新的资产编号");
					} else {
	    				startUpload(SaveData);
					}	            	
	            }
	    	});
		} 
    }
    
    function onTypeFilterChanged(e){
    	var tempType = e.value;
    	getSecType(tempType);
    	getAssetAmount();
    	
    }
    
    function onNameFilterChanged(e){
    	var tempType=e;
    	showEmpAndOrg(tempType);
    }
    
    function onStatusFilterChanged(e){
    	var tempType=e.value;
    	if(tempType == 1 || tempType == 2 || tempType == 3){
    		var storage = nui.get("storageType");
    		storage.setValue(2);
    		showEmpAndOrg(2);
    	}
    }
    
    function getGuoTeng(e) {
    	var tempGuoTeng = e.value;
    	if (tempGuoTeng == 1) {
    		nui.get("projectno").setRequired(true);
    	}else if (tempGuoTeng == 0) {
    		nui.get("projectno").setRequired(false);    		
    	}
    }
    
    function getAssetnum(){
    	if(setData == "edit"){
    		return;
    	} else {
	    	var assetnum = nui.get("assetnum");
	    	var type = nui.get("type").getValue();
	    	var area = nui.get("area").getValue();
	    	var sectype = nui.get("sectype").getValue();
	    	if(sectype){
	    		setDis();
	    	}
	    	if(area == null || area == "" || type == null || type == "" || sectype == null || sectype == ""){
	    		return;
	    	}
	    	var tempTitle = "";
	    	var tempLength = 0;
			if(area == 1){
				tempTitle = "BJ" + sectype;
			} else if(area == 3){
				tempTitle = "GZ" + sectype;
			} else if(area == 4){
				tempTitle = "XA" + sectype;
			} else if(area == 5){
				tempTitle = "CD" + sectype;
			} else if(area == 6){
				tempTitle = "WH" + sectype;
			} else if(area == 7){
				tempTitle = "NJ" + sectype;
			} else if(area == 8){
				tempTitle = "JN" + sectype;
			} else if(area == 9){
				tempTitle = "SZ" + sectype;
			} else {
				if(type == "V" || type == "X"){
					tempTitle = type;
				} else {
		    		tempTitle = sectype;
				}
	    		if(type == "EPC"){
	    			if(sectype == "EPCDT" || sectype == "EPCNB"){
	    				tempLength = 8;	
	    			} else {
	    				tempLength = 9;
	    			}
	    		} else {
	    			tempLength = 5;
	    			if(type == "V" || type == "X"){
	    				tempLength = 4;
	    			} 
	    		}
    		}
		}

		if(area != 2){
			if(type == "V" || type == "X"){
				tempTitle = tempTitle.substring(0,3);
				tempLength = 6;
			} else if(type == "EPC"){
				if(sectype == "EPCDT" || sectype == "EPCNB"){
					tempLength = 10;	
				} else {
					tempLength = 11;
    			}
			} else {
				tempLength = 7;
			}
		}
		if (tempTitle == "")  {return;}
		
    	var json = {tempTitle:tempTitle,tempLength:tempLength};
    	nui.ajax({
    		url: "com.primeton.eos.machine.machine.getAssetnum.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function(o){
				var data = o.assetnum;
    			assetnum.setValue(data);
    			nui.get("assetnum").validate();
            }
    	});
    }
    
    //设置折旧年限
    function setDis(){
	    var dictid = nui.get("sectype").getValue();
	    if(dictid){
	   	 	var json = {dictid:dictid,dicttypeid:"MIS_MA_SECTYPE"}
	    	nui.ajax({
	    		url: "com.primeton.eos.machine.machine.geteosdictbydictid.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function(o){
					var dict = o.dict;
					var depreciableTime= dict.filter1;
					nui.get("depreciableTime").setValue(depreciableTime);
	            }
	    	});
	    }
    }
    
    function showEmpAndOrg(tempType){
    	if(tempType == "2"){   
			document.getElementById("temp1").style.display = "none";
			document.getElementById("temp2").style.display = "none";
			document.getElementById("temp3").style.display = "none";
			document.getElementById("temp4").style.display = "none";
			nui.get("usingemp").setValue("");
			nui.get("deptname").setValue("");
    	}else if(tempType == "0"){   		
			document.getElementById("temp3").style.display = "none";
			document.getElementById("temp4").style.display = "none";
    		document.getElementById("temp1").style.display = "";
			document.getElementById("temp2").style.display = "";
			nui.get("deptname").setValue("");
    	} else {
    		document.getElementById("temp1").style.display = "";
			document.getElementById("temp2").style.display = "";
			document.getElementById("temp3").style.display = "";
			document.getElementById("temp4").style.display = "";
			nui.get("usingemp").setValue("");
			nui.get("deptname").setValue("");
    	} 
    }
    
    function getSecType(tempType){
    	var json = {parentId:tempType};
    	nui.ajax({
    		url: "com.primeton.eos.machine.machine.getSecType.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function(o){
				var data = o.childType;
				var secType = nui.get("sectype");      	
				secType.load(data);
				secType.select(0);
    			setDis();
				getAssetnum();
            }
    	});
    }
    
    function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						nui.get("startusedate").setValue("");
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);
		                var storageType = nui.get("storageType").getValue();
		                if(storageType =="1"){
			                var temp2=nui.get("deptname");
			                temp2.setValue(data.orgid);
			                temp2.setText(data.orgname);
		                }
					}
				}
				nui.get("usingemp").validate();
				nui.get("deptname").validate();
			}
		});
	}
	//选择项目
	function selectProject(){
		var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath()%>/ame_common/SelectProject.jsp?preSettle=bukongzhi",
            title: "选择项目",
            width: 850,
            height: 420,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectno);
                    }
				}
			}
        });
	}
	
    function showDept(e){
    	var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectOrganization.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                //if (action == "close") return false;
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须克隆
                    if (data) {                   	
						btnEdit.setValue(data.orgid);
		                btnEdit.setText(data.orgname);
                    }
                }
				nui.get("deptname").validate();
			}
        });
    }
    
    function validateAssetnum(){
    	var assetnum = nui.get("assetnum");
    	var num=assetnum.getValue();
    	var data={assetnum:num};
    	var json=nui.encode(data);
    	nui.ajax({
    		url: "com.primeton.eos.machine.machine.validateAssetnum.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function(var1){
            	var test=nui.decode(var1);
            	return test.test;
            }
    	});
    }
    
    function doDelete(fileID){
        nui.confirm("确定删除该附件？", "确定？",
            function (action) {
                if (action == "ok") {
                    var json = nui.encode({fileid: fileID});
                    nui.ajax({
                        url: "com.primeton.eos.machine.machine.deleteFile.biz.ext",
                        type: 'POST',
                        data: json, 
                        contentType: 'text/json',
                        success: function (o) {
                            var tempSrc = "";
                            for(var i=0;i<o.files.length;i++){
                                tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.machine.files[i].fileId+ "'>" + o.machine.files[i].fileName + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='mini-button' iconCls='icon-remove' onclick='doDelete(" + o.machine.files[i].fileId + ")'></a>,";
                   			}
                            document.getElementById("uploadedFile").innerHTML = tempSrc;
                            nui.parse();                
                        }
                    });
                }
            }
        );
    }
    
    //计算折旧金额
    function depreciableAmountComp(e){
    	var machinePrice=nui.get("assetAmount").value;
    	var depreciableTime=nui.get("depreciableTime").value;
    	var depreciableAmount = 0;
    	if(isNumeric(machinePrice)){
    		depreciableAmount = (machinePrice/depreciableTime).toFixed(2);
    		nui.get("depreciableAmount").setValue(depreciableAmount);
    	}else{
    		nui.get("depreciableAmount").setValue(null);
    	}   			
    }
    
    //获取资产原值
    function getAssetAmount(){
		//产品税率
		var  productrate1  = nui.get("productrate").getValue();
		if(!productrate1){
			nui.get("productrate").setValue(productrate);
		}
		productrate1  = nui.get("productrate").getValue();
    	var amount = 0;
    	var price = nui.get("price").getValue();
    	var invoiceType = nui.get("invoiceType").getValue();
    	var assetAmount = nui.get("assetAmount");
    	if(invoiceType == 0){
    		amount = price;
    		assetAmount.setValue(amount);
    	}else if(invoiceType == 1){
    		amount = (price / (1+parseFloat(productrate1))).toFixed(2);
    		assetAmount.setValue(amount);
    	}
    	depreciableAmountComp(); 
    }
    
    function isNumeric(value){
    	if(value == null || isNaN(value) || value<=0 || value.indexOf(" ")!=-1){
    		return false;
    	}else{
    		return true;	
    	}
    }
        
</script>
</body>
</html>